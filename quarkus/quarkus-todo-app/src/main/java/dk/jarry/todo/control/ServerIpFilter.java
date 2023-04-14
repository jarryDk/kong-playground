package dk.jarry.todo.control;

import java.io.IOException;

import org.jboss.logging.Logger;

import io.vertx.core.http.HttpServerRequest;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerResponseContext;
import jakarta.ws.rs.container.ContainerResponseFilter;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.ext.Provider;

@Provider
public class ServerIpFilter implements ContainerResponseFilter {

	private static final Logger LOG = Logger.getLogger(ServerIpFilter.class);

	@Context
	HttpServerRequest request;

	@Override
	public void filter(ContainerRequestContext requestContext, ContainerResponseContext responseContext)
			throws IOException {

		String name = "X-server-ip";
		String serverIp = request.localAddress().host();
		responseContext.getHeaders().add(name, serverIp);

		String remoteIp = request.remoteAddress().host();
		responseContext.getHeaders().add("X-remote-ip", remoteIp);

		responseContext.getHeaders().add("X-backend", "Quarkus");

		LOG.info("X-server-ip: " + serverIp);
		LOG.info("X-remote-ip: " + remoteIp);

	}

}