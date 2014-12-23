# Start redish on mac installed from Homebrew

if [[ -f /usr/local/etc/redis.conf ]]; then
  alias redis_start='redis-server /usr/local/etc/redis.conf'
fi
