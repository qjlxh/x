[custom]


p: &p {type: http, interval: 86400, health-check: {enable: true, url: "https://www.gstatic.com/generate_204", interval: 180}}
p0: &p0 {type: select, include-all: true, filter: "(?i)🇦🇫|🇦🇶|🇦🇷|🇦🇹|🇦🇺|🇧🇩|🇧🇲|🇧🇷|🇧🇹|🇧🇾|🇨🇦|🇨🇫|🇨🇭|🇨🇱|🇨🇳|🇨🇴|🇨🇺|🇨🇽|🇩🇪|🇩🇰|🇪🇬|🇪🇸|🇪🇹|🇪🇺|🇫🇮|🇫🇷|🇬🇧|🇬🇮|🇬🇱|🇬🇳|🇬🇷|🇭🇰|🇭🇺|🇮🇩|🇮🇪|🇮🇳|🇮🇶|🇮🇷|🇮🇸|🇯🇲|🇯🇵|🇰🇭|🇰🇵|🇰🇷|🇰🇼|🇱🇦|🇱🇹|🇲🇲|🇲🇳|🇲🇴|🇲🇺|🇲🇻|🇲🇽|🇲🇾|🇳🇱|🇳🇴|🇳🇵|🇳🇿|🇵🇦|🇵🇪|🇵🇭|🇵🇰|🇵🇱|🇵🇸|🇵🇹|🇷🇺|🇸🇦|🇺🇳|🇸🇪|🇸🇬|🇸🇴|🇸🇾|🇹🇭|🇹🇯|🇹🇷|🇹🇼|🇺🇦|🇺🇬|🇺🇸|🇻🇦|🇻🇪|🇻🇳|🇼🇸|🇿🇦|🇿🇼"}
p1: &p1 {type: select, proxies: [自动选择, 负载均衡, 字节跳动, 中国, 节能, 莱垠],  <<: *p0}
p2: &p2 {type: url-test, include-all: true, tolerance: 10, exclude-filter: "(?i)莱垠|•|付|费|到|期|剩|余|套|餐|官|网|欢|迎|注|册|群|节|点|去|公"}
p3: &p3 {type: load-balance, include-all: true, tolerance: 10, exclude-filter: "(?i)莱垠|付|费|到|期|剩|余|套|餐|官|网|欢|迎|注|册|群|节|点|去|公"}
p4: &p4 {type: url-test, include-all: true, tolerance: 10, exclude-filter: "(?i)莱垠|•|🇭🇰|香港|hk|🇹🇼|台湾|tw|付|费|到|期|剩|余|套|餐|官|网|欢|迎|注|册|群|节|点|去|公"}
p5: &p5 {type: url-test, include-all: true, tolerance: 10, filter: "(?i)CN"}
p6: &p6 {type: url-test, include-all: true, tolerance: 10, filter: "(?i)•"}
p7: &p7 {type: select, include-all: true, filter: "(?i)莱垠"}
p8: &p8 {type: select, proxies: [DIRECT, 节点选择, 负载均衡, 中国, 节能]}
p9: &p9 {type: select, proxies: [节点选择, DIRECT, 负载均衡, 中国, 节能]}
proxy-groups:
  - {name: 节点选择,  <<: *p1, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/Heart.png"}
  - {name: 自动选择,  <<: *p2, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/QQ.png"}
  - {name: 负载均衡,  <<: *p3, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/Luffy.png"}
  - {name: 字节跳动,  <<: *p4, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/TikTok.png"}
  - {name: 中国,  <<: *p5, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/China.png"}
  - {name: 节能,  <<: *p6, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/Bamboo.png"}
  - {name: 莱垠,  <<: *p7, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/Panda.png"}
  - {name: 全球直连,  <<: *p8, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/China_Map.png"}
  - {name: 节点代理,  <<: *p9, icon: "https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/mini/Global.png"}
rules:
    - RULE-SET,category-ads-all_domain,REJECT
    - GEOSITE,category-ads-all,REJECT
    - GEOIP,lan,全球直连,no-resolve
    - RULE-SET,facebook_domain,节点选择
    - GEOSITE,facebook,节点选择
    - RULE-SET,github_domain,节点选择
    - GEOSITE,github,节点选择
    - RULE-SET,google_domain,节点选择
    - GEOSITE,google,节点选择
    - RULE-SET,netflix_domain,字节跳动
    - GEOSITE,netflix,字节跳动
    - RULE-SET,openai_domain,字节跳动
    - GEOSITE,openai,字节跳动
    - RULE-SET,telegram_domain,节点选择
    - GEOSITE,telegram,节点选择
    - RULE-SET,tiktok_domain,字节跳动
    - GEOSITE,tiktok,字节跳动
    - RULE-SET,twitter_domain,节点选择
    - GEOSITE,twitter,节点选择
    - RULE-SET,youtube_domain,节点选择
    - GEOSITE,youtube,节点选择
    - RULE-SET,geolocation-!cn_domain,节点选择
    - GEOSITE,geolocation-!cn,节点选择
    - RULE-SET,facebook_ip,节点选择
    - GEOIP,facebook,节点选择
    - RULE-SET,google_ip,节点选择
    - GEOIP,google,节点选择
    - RULE-SET,netflix_ip,字节跳动
    - GEOIP,netflix,字节跳动
    - RULE-SET,twitter_ip,节点选择
    - GEOIP,twitter,节点选择
    - RULE-SET,telegram_ip,节点选择
    - GEOIP,telegram,节点选择
    - RULE-SET,us_ip,节点选择
    - GEOIP,us,节点选择
    - GEOSITE,microsoft@cn,全球直连
    - RULE-SET,apple-cn_domain,全球直连
    - GEOSITE,apple-cn,全球直连
    - RULE-SET,private_domain,全球直连
    - GEOSITE,private,全球直连
    - RULE-SET,cn_domain,全球直连
    - GEOSITE,cn,全球直连
    - RULE-SET,private_ip,全球直连,no-resolve
    - GEOIP,private,全球直连,no-resolve
    - RULE-SET,cn_ip,全球直连,no-resolve
    - GEOIP,cn,全球直连,no-resolve
    - MATCH,节点选择
rule-anchor:
  ip: &ip {type: http, interval: 86400, behavior: ipcidr, format: text}
  domain: &domain {type: http, interval: 86400, behavior: domain, format: text}
rule-providers:
  apple-cn_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/apple-cn.list"
  category-ads-all_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/category-ads-all.list"
  cn_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/cn.list"
  facebook_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/facebook.list"
  geolocation-!cn_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/geolocation-!cn.list"
  github_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/github.list"
  google_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/google.list"
  netflix_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/netflix.list"
  openai_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/openai.list"
  private_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/private.list"
  telegram_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/telegram.list"
  tiktok_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/tiktok.list"
  twitter_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/twitter.list"
  youtube_domain:
    <<: *domain
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/youtube.list"
  cn_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/cn.list"
  facebook_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/facebook.list"
  google_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/google.list"
  netflix_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/netflix.list"
  private_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/private.list"
  telegram_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/telegram.list"
  twitter_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/twitter.list"
  us_ip:
    <<: *ip
    url: "https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/us.list"