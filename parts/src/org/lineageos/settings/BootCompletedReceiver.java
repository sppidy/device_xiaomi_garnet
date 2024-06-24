/*
 * Copyright (C) 2015 The CyanogenMod Project
 *               2017-2020 The LineageOS Project
 * Copyright (C) 2023 Paranoid Android
 * SPDX-License-Identifier: Apache-2.0
 */

package org.lineageos.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.hardware.display.DisplayManager;
import android.os.IBinder;
import android.util.Log;
import android.view.Display;
import android.view.Display.HdrCapabilities;

import org.lineageos.settings.doze.DozeUtils;
import org.lineageos.settings.thermal.ThermalUtils;
import org.lineageos.settings.refreshrate.RefreshUtils;
import org.lineageos.settings.dolby.DolbyUtils;

public class BootCompletedReceiver extends BroadcastReceiver {
    private static final boolean DEBUG = false;
    private static final String TAG = "XiaomiParts-BCR";

    @Override
    public void onReceive(final Context context, Intent intent) {
        if (DEBUG)
            Log.d(TAG, "Received boot completed intent");
        DozeUtils.onBootCompleted(context);
        ThermalUtils.startService(context);
        RefreshUtils.startService(context);        
        DolbyUtils.getInstance(context).onBootCompleted();

        // Dolby Atmos
        DolbyUtils.getInstance(context).onBootCompleted();

        Log.i(TAG, "Boot completed");

        // Dolby Atmos
        DolbyUtils.getInstance(context);     

        // Refresh Rate
        RefreshUtils.initialize(context);

        // Override HDR types
        final DisplayManager displayManager = context.getSystemService(DisplayManager.class);
        displayManager.overrideHdrTypes(Display.DEFAULT_DISPLAY, new int[]{
                HdrCapabilities.HDR_TYPE_DOLBY_VISION, HdrCapabilities.HDR_TYPE_HDR10,
                HdrCapabilities.HDR_TYPE_HLG, HdrCapabilities.HDR_TYPE_HDR10_PLUS});
    }
}
