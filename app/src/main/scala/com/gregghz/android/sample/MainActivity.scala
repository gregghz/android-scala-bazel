package com.gregghz.android.sample

import android.widget.{ImageView, TextView}
import android.app.Activity
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.graphics.drawable.Animatable

class MainActivity extends AppCompatActivity {
  override def onCreate(savedInstanceState: Bundle): Unit = {
    super.onCreate(savedInstanceState)

    setContentView(R.layout.main)

    findViewById[TextView](R.id.text).setText(s"Hello world, from ${getString(R.string.app_name)}")
    findViewById[ImageView](R.id.image).getDrawable() match {
      case a: Animatable => a.start()
      case _ =>
    }
  }
}