package com.cms.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;
import org.springframework.web.client.AsyncRestTemplate;

/**
 * @author : JB
 * @packageName : com.jaseng.common.util
 * @fileName : HttpApiUtil
 * @description : HTTP API CALL UTILs
 * @since : 2023-06-27
 */

public class HttpApiUtil {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private AsyncRestTemplate asyncRestTemplate;

    public HttpApiUtil(AsyncRestTemplate asyncRestTemplate) {
        this.asyncRestTemplate = asyncRestTemplate;
    }

    public <T> void callPostApi(String URL, T DTO) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<T> requestEntity = new HttpEntity<T>(DTO, headers);
        ParameterizedTypeReference<T> responseType = new ParameterizedTypeReference<T>() {};
        ListenableFuture<ResponseEntity<T>> responseFuture = asyncRestTemplate.exchange(URL, HttpMethod.POST,
                                                                requestEntity, responseType );

        responseFuture.addCallback(new ListenableFutureCallback<ResponseEntity<T>>() {
            public void onFailure(Throwable ex) {
                logger.error("failMsg={}", ex.getMessage());
            }

            public void onSuccess(ResponseEntity<T> result) {
                logger.info("API Call Success, response status code={}", result.getStatusCode());
                T responsebody = result.getBody();
                logger.info("response Result={}", responsebody.toString());
            }
        });
    }
}
