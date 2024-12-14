# Code server
Here you can find a docker compose stack to run various containers that will give you a programming environment on the web.
With the dockerfiles, you can prepare these containers however you want and then run them in the browser from wherever you are.
I set this up for my university work, because I hated the constant rubbish on my computer whenever a new semester started and we had to learn yet another programming language

In here are Dockerfiles for:
- haskell (hk)
- latex
- npm
- java
- python
- flutter (which i havent tested yet)

## Caddyfile
I serve all of these containers under one subdomain, with sub-paths. Here is one example for tex

The `header` you can find in the caddy [README.md](../caddy/README.md)

```
# ==================== TEX ====================
(tex) {
    reverse_proxy tex-server:8443 {
        import code-header1
    }
    header {
        import code-header2
    }
}

code.jonnyebinger.de {
    redir /tex /tex/login

    handle_path /tex/* {
        import tex
    }
}
```