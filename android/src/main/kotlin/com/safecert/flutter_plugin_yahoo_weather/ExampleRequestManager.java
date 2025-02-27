package com.safecert.flutter_plugin_yahoo_weather;

// Copyright 2019 Oath Inc. Licensed under the terms of the zLib license see https://opensource.org/licenses/Zlib for terms.

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

public class ExampleRequestManager {
    private static ExampleRequestManager sInstance;

    Context mContext;
    RequestQueue mRequestQueue;

    public static synchronized ExampleRequestManager getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new ExampleRequestManager(context);
        }
        return sInstance;
    }

    private ExampleRequestManager(Context context) {
        mContext = context;
        mRequestQueue = Volley.newRequestQueue(mContext);
    }

    public <T> void addToRequestQueue(Request<T> request) {
        mRequestQueue.add(request);
    }
}
