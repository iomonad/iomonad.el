;; reading rss feeds

(use-package elfeed
  :ensure t)

(setq elfeed-feeds
      '("https://lobste.rs/rss"
        "https://news.ycombinator.com/rss"
	"https://xkcd.com/rss.xml"
	"http://boards.4chan.org/pol/index.rss"))

(provide 'pkg-elfeed)
