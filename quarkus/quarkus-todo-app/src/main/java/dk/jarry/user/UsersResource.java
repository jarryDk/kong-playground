package dk.jarry.user;

import jakarta.inject.Inject;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.jboss.resteasy.reactive.NoCache;

import io.quarkus.security.identity.SecurityIdentity;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

@Path("/api/users")
public class UsersResource {

    @Inject
    SecurityIdentity identity;

    @GET
    @Path("/me")
    @NoCache
    public User me() {
        return new User(identity);
    }

    public static class User {

        private final String userName;
        private Set<String> roles;

        User(SecurityIdentity identity) {
            this.userName = identity.getPrincipal().getName();
            this.roles = identity.getRoles();
        }

        public String getUserName() {
            return userName;
        }

        public Set<String> getRoles() {
            return roles;
        }

    }

}