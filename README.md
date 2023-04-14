# Screenshot Site Canary
A devops tool for detecting changes in live websites.
It works by screenshoting the website, hashing the screenshot, and comparing it to a previous hash that it had.

Set to run daily for best results.

## How to use:
1. Put your domains into `config.txt` as such:
```
google.com https://www.google.com/
example.org https://example.org/
```
2. `mkdir img`
3. Run `./Dockerfile` if you are on linux, otherwise build the docker file and run it manually.
4. Results should look like this:
```
processing: google.com -> https://www.google.com/
starting browser...
requesting page...
saving and closing...
img/google.com_screenshot.png
1920x1920 -> 64x64
62841 bytes -> 1004 bytes

1 processed in 0.1335 seconds.
[i] img_hash: e86ac993d41fdde1d7efa89ce7aa6f4d089251341c2b349c725640a10115a496
[+] hash match for google.com
processing: example.org -> https://example.org/
starting browser...
requesting page...
saving and closing...
img/example.org_screenshot.png
1920x1920 -> 64x64
43643 bytes -> 584 bytes

1 processed in 0.1330 seconds.
[i] img_hash: 7b1ebeb5fe3363299007ebb1089a7ee5476f0bed17ad2cd6f8cf16b70ff55954
[+] hash match for example.org
```

