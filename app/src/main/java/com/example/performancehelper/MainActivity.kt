package com.example.performancehelper

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val text = TextView(this).apply {
            textSize = 18f
            setPadding(32, 48, 32, 48)
            text = """
                QQ飞车 / Speed Drifters Performance

                Safe performance helper
                • No Google Play Services dependency
                • No game-process injection
                • No CPU/GPU frequency forcing
                • No thermal-limit bypass
                • No frame-freezing tricks
                • Targets smoother frame pacing where Android permits

                Supported targets:
                com.tencent.tmgp.speedmobile
                com.garena.game.fctw

                Android controls actual refresh rate and thermal policy.
            """.trimIndent()
        }
        setContentView(text)
    }
}
