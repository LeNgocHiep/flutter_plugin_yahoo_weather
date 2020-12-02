package com.safecert.flutter_plugin_yahoo_weather;

// Copyright 2019 Oath Inc. Licensed under the terms of the zLib license see https://opensource.org/licenses/Zlib for terms.

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.toolbox.HttpHeaderParser;
import com.android.volley.toolbox.JsonRequest;
import com.google.gson.JsonSyntaxException;

import net.oauth.OAuth;
import net.oauth.OAuthAccessor;
import net.oauth.OAuthConsumer;
import net.oauth.OAuthException;
import net.oauth.OAuthMessage;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

public class ExampleRequest<T> extends JsonRequest<T> {

    String appId;
    String CONSUMER_KEY;
    String CONSUMER_SECRET;
    String baseUrl;

    public ExampleRequest(int method, Response.Listener<T> listener, Response.ErrorListener errorListener, String appId, String consumerKey, String consumerSecret, String requestURL) {
        super(method, null, null, listener, errorListener);
        this.appId = appId;
        this.CONSUMER_KEY = consumerKey;
        this.CONSUMER_SECRET = consumerSecret;
        this.baseUrl = requestURL;
    }

    @Override
    public Map<String, String> getHeaders() throws AuthFailureError {
        Map<String, String> headers = new HashMap<>();
        OAuthConsumer consumer = new OAuthConsumer(null, CONSUMER_KEY, CONSUMER_SECRET, null);
        consumer.setProperty(OAuth.OAUTH_SIGNATURE_METHOD, OAuth.HMAC_SHA1);
        OAuthAccessor accessor = new OAuthAccessor(consumer);
        OAuthMessage request = null;
        try {
            request = accessor.newRequestMessage(OAuthMessage.GET, getUrl(), null);
        } catch (OAuthException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        String authorization = null;
        try {
            authorization = request.getAuthorizationHeader(null);
        } catch (IOException e) {
            e.printStackTrace();
        }
        headers.put("Authorization", authorization);
        headers.put("X-Yahoo-App-Id", appId);
        headers.put("Content-Type", "application/json");
        return headers;
    }

    @Override
    public String getUrl() {
        return baseUrl;
    }

    @Override
    protected Response<T> parseNetworkResponse(NetworkResponse response) {
        try {
            String json = new String(
                    response.data,
                    HttpHeaderParser.parseCharset(response.headers));
            T parsedResponse = parseResponse(json);
            return Response.success(
                    parsedResponse,
                    HttpHeaderParser.parseCacheHeaders(response));
        } catch (UnsupportedEncodingException | JsonSyntaxException e) {
            return Response.error(new ParseError(e));
        }
    }

    private T parseResponse(String jsonObject) {
//        return null; // Add response parsing here
        return (T) jsonObject;
    }
}
