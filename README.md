Run Neovim + Claude in Docker:

```
sudo docker run --rm -it  --user linagora --name prepperdev --env PATH="/home/linagora/.local/bin:$PATH" -v /home/debian/RepoGit/dockernvim:/home/linagora/.config -v $(pwd):/home/linagora/nginx -w /home/linagora/nginx nvimdocker
```
