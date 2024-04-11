[custom]


ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/netflix.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geoip/us.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/netflix.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/openai.list
ruleset=字节跳动,https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo/geosite/tiktok.list
ruleset=全球直连,[]GEOIP,CN
ruleset=节点代理,[]FINAL


custom_proxy_group=节点选择`select`[]自动选择`[]负载均衡`[]字节跳动`[]中国`[]节能`[]莱垠`[]DIRECT`.*`http://www.gstatic.com/generate_204`180,,50
custom_proxy_group=自动选择`url-test`(^(?!.*(莱垠|•|付|余|公|册|到|剩|去|套|官|期|欢|注|点|网|群|节|费|迎|道|钱|频|餐)).*)
custom_proxy_group=负载均衡`load-balance`(^(?!.*(莱垠|付|余|公|册|到|剩|去|套|官|期|欢|注|点|网|群|节|费|迎|道|钱|频|餐)).*)
custom_proxy_group=字节跳动`url-test`(^(?!.*(莱垠|•|🇭🇰|香港|hk|🇹🇼|台湾|tw|付|余|公|册|到|剩|去|套|官|期|欢|注|点|网|群|节|费|迎|道|钱|频|餐)).*)
custom_proxy_group=中国`url-test`(CN)
custom_proxy_group=节能`url-test`(•.)
custom_proxy_group=莱垠`url-test`(莱垠)
custom_proxy_group=全球直连`select`[]DIRECT`[]节点选择`[]自动选择`[]负载均衡`[]字节跳动`[]中国`[]节能`[]莱垠
custom_proxy_group=节点代理`select`[]节点选择`[]DIRECT`[]自动选择`[]负载均衡`[]字节跳动`[]中国`[]节能`[]莱垠



enable_rule_generator=true
overwrite_original_rules=true