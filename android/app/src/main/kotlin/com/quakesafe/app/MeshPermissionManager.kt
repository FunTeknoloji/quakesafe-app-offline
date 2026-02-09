package com.quakesafe.app

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.content.ContextCompat

class MeshPermissionManager {
    fun getMissingPermissions(context: Context): List<String> {
        val basePermissions = mutableListOf(
            Manifest.permission.ACCESS_FINE_LOCATION,
            Manifest.permission.ACCESS_COARSE_LOCATION,
        )

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            basePermissions += Manifest.permission.BLUETOOTH_SCAN
            basePermissions += Manifest.permission.BLUETOOTH_CONNECT
            basePermissions += Manifest.permission.BLUETOOTH_ADVERTISE
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            basePermissions += Manifest.permission.ACCESS_BACKGROUND_LOCATION
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            basePermissions += Manifest.permission.POST_NOTIFICATIONS
        }

        return basePermissions.filter { permission ->
            ContextCompat.checkSelfPermission(context, permission) != PackageManager.PERMISSION_GRANTED
        }
    }

    fun onPermissionResult(result: Map<String, Boolean>) {
        val denied = result.entries.filterNot { it.value }.map { it.key }
        if (denied.isNotEmpty()) {
            // Hook for analytics / UX fallback; mesh discovery can continue in degraded mode.
        }
    }
}
