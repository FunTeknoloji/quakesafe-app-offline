package com.quakesafe.app

import android.os.Build
import android.os.Bundle
import androidx.activity.result.contract.ActivityResultContracts
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    private val meshPermissionManager = MeshPermissionManager()

    private val permissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestMultiplePermissions()
    ) { result ->
        meshPermissionManager.onPermissionResult(result)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        requestMeshPermissionsIfNeeded()
    }

    private fun requestMeshPermissionsIfNeeded() {
        val missingPermissions = meshPermissionManager.getMissingPermissions(this)
        if (missingPermissions.isNotEmpty()) {
            permissionLauncher.launch(missingPermissions.toTypedArray())
        }
    }

    companion object {
        fun requiresNotificationPermission(): Boolean =
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
    }
}
