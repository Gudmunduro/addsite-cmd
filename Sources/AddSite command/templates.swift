
class Templates {
    
    static func laravelNginxConfig(documentRoot: String, domain: String, subDomain: String = "") -> String
    {
        let fullDomain = ((subDomain == "") ? subDomain + "." : "") + domain;
        return
        """
        server {
                    listen         80;
                    listen         [::]:80;
                    listen         443 ssl;

                    ssl_certificate     \(domain).crt;
                    ssl_certificate_key \(domain).key;
                    server_name    \(fullDomain);
                    root           \(documentRoot)/public;
                    index          index.html index.php;
                    client_max_body_size 2G;

                    if ($scheme = http) {
                        return 301 https://$server_name$request_uri;
                    }

                    location / {
                        try_files $uri $uri/ /index.php?$query_string;
                    }

                    location ~* \\.php$ {
                        try_files $uri /index.php =404;
                        fastcgi_split_path_info ^(.+\\.php)(/.+)$;
                        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
                        fastcgi_index index.php;
                        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                        include fastcgi_params;
                    }
                }
        """
    }
    static func normalNginxConfigFile(documentRoot: String, domain: String, subDomain: String = "") -> String
    {
        let fullDomain = ((subDomain == "") ? subDomain + "." : "") + domain;
        return
        """
        server {
                    listen         80;
                    listen         [::]:80;
                    listen         443 ssl;

                    ssl_certificate     \(domain).crt;
                    ssl_certificate_key \(domain).key;
                    server_name    \(domain);
                    root           \(documentRoot);
                    index          index.html index.php;
                    client_max_body_size 2G;

                    if ($scheme = http) {
                    return 301 https://$server_name$request_uri;
                    }

                    location / {
                    try_files $uri $uri/ =404;
                    }

                    location ~* \\.php$ {
                    try_files $uri /index.php =404;
                    fastcgi_split_path_info ^(.+\\.php)(/.+)$;
                    fastcgi_pass unix:/run/php/php7.2-fpm.sock;
                    fastcgi_index index.php;
                    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                    include fastcgi_params;
                    }
                }
        """
    }

}
