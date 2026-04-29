Run Neovim + Claude in Docker:

```
sudo docker run --rm -it  --user linagora --name prepperdev --env PATH="/home/linagora/.local/bin:$PATH" -v /home/linagora/nvimprepperconfig/config:/home/linagora/.config -v /home/linagora/data-prepper/:/home/linagora/data-prepper/ -w /home/linagora nvimprepper
```
