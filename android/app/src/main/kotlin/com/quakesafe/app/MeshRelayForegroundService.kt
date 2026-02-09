package com.quakesafe.app

import android.app.Notification
import android.app.Service
import android.content.Intent
import android.os.IBinder

class MeshRelayForegroundService : Service() {
    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        startForeground(NOTIFICATION_ID, Notification())
        return START_STICKY
    }

    companion object {
        private const val NOTIFICATION_ID = 1142
    }
}
