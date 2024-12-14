# Matrix

This took me the most amount of time to implement.
I just recently upgraded the instance to Matrix 2.0 with sliding sync. As this was very annoying, I wanted to post the configuration.

My caddy configuration is:

```caddyfile
(header2){
    some header stuff
}
(header1){
    some header stuff
}
# ===================================== SYNCV3 =======================================
syncv3.jonnyebinger.de {
	header {
		import header2
	}

	reverse_proxy /* {
		to 172.19.0.16:9009
		import header1
	}
	log {
      output discard
  }
	
}

synapse.jonnyebinger.de:8448 {
  reverse_proxy /_matrix/* {
		to 172.19.0.14:8008
		import header1
	}
}

# ===================================== MATRIX =======================================
synapse.jonnyebinger.de {
	header {
		import header2
	}
	@forbidden {
		path /_synapse*
	}
	respond @forbidden 403
	respond /.well-known/matrix/server `{"m.server": "synapse.jonnyebinger.de:443"}`
	handle /.well-known/matrix/client {
		respond `{ "m.server": "https://synapse.jonnyebinger.de", "m.homeserver": { "base_url": "https://synapse.jonnyebinger.de" }, "m.identity_server": { "base_url": "https://matrix.org" }, "org.matrix.msc3575.proxy": { "url": "https://syncv3.jonnyebinger.de" }}` 200
	}
	
	reverse_proxy /* {
		to 172.19.0.14:8008
		import header1
	}
	log {
      output discard
  }
	
}
```
