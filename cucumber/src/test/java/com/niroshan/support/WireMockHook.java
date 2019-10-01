package com.niroshan.support;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.client.WireMock;
import cucumber.api.java.After;
import cucumber.api.java.Before;

import static com.github.tomakehurst.wiremock.client.WireMock.aResponse;

public class WireMockHook {

	private int wireMockPort = 9110;
	private String wireMockHost = "localhost";
	private WireMockServer wireMockServer;
	private WireMock wireMock;

	@Before("@wiremockApi")
	public void setupWiremockServer() throws InterruptedException {
		wireMockServer = new WireMockServer(wireMockPort);
		wireMock = new WireMock(wireMockHost, wireMockPort);
		wireMockServer.start();
		
		wireMock.register(WireMock.get(WireMock.urlPathMatching("/testGet")).willReturn(aResponse().withStatus(200)
				.withHeader("Content-Type", "application/json").withBody("{\"message\": \"Success\"}")));
	}
	
	@After("@wiremockApi")
	public void teardownWiremockServer() {
		wireMockServer.stop();
	}
}
