[custom]


ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/netflix.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/us.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/netflix.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/openai.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/tiktok.list
ruleset=全球直连,[]GEOIP,CN
ruleset=节点代理,[]FINAL



p0: &p0 {type: select, include-all: true, filter: "(?i)🇦🇫|🇦🇶|🇦🇷|🇦🇹|🇦🇺|🇧🇩|🇧🇲|🇧🇷|🇧🇹|🇧🇾|🇨🇦|🇨🇫|🇨🇭|🇨🇱|🇨🇳|🇨🇴|🇨🇺|🇨🇽|🇩🇪|🇩🇰|🇪🇬|🇪🇸|🇪🇹|🇪🇺|🇫🇮|🇫🇷|🇬🇧|🇬🇮|🇬🇱|🇬🇳|🇬🇷|🇭🇰|🇭🇺|🇮🇩|🇮🇪|🇮🇳|🇮🇶|🇮🇷|🇮🇸|🇯🇲|🇯🇵|🇰🇭|🇰🇵|🇰🇷|🇰🇼|🇱🇦|🇱🇹|🇲🇲|🇲🇳|🇲🇴|🇲🇺|🇲🇻|🇲🇽|🇲🇾|🇳🇱|🇳🇴|🇳🇵|🇳🇿|🇵🇦|🇵🇪|🇵🇭|🇵🇰|🇵🇱|🇵🇸|🇵🇹|🇷🇺|🇸🇦|🇺🇳|🇸🇪|🇸🇬|🇸🇴|🇸🇾|🇹🇭|🇹🇯|🇹🇷|🇹🇼|🇺🇦|🇺🇬|🇺🇸|🇻🇦|🇻🇪|🇻🇳|🇼🇸|🇿🇦|🇿🇼"}
p1: &p1 {type: select, proxies: [自动选择, 负载均衡, 字节跳动, 中国, 节能, 莱垠],  <<: *p0}
p2: &p2 {type: url-test, include-all: true, tolerance: 10, exclude-filter: "(?i)莱垠|•|付|余|公|册|到|剩|去|套|官|期|欢|注|点|网|群|节|费|迎|道|钱|频|餐"}
p3: &p3 {type: load-balance, include-all: true, tolerance: 10, exclude-filter: "(?i)莱垠|付|余|公|册|到|剩|去|套|官|期|欢|注|点|网|群|节|费|迎|道|钱|频|餐"}
p4: &p4 {type: url-test, include-all: true, tolerance: 10, exclude-filter: "(?i)莱垠|•|🇭🇰|香港|hk|🇹🇼|台湾|tw|付|余|公|册|到|剩|去|套|官|期|欢|注|点|网|群|节|费|迎|道|钱|频|餐"}
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


enable_rule_generator=true
overwrite_original_rules=true