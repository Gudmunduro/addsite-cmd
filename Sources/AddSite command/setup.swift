import Foundation
import Files

enum Template: Int {
    case laravel = 1
    case normal = 2
}

class Setup {

    let domain: String
    let subDomain: String
    let fullDomain: String
    let template: Template
    let documentRoot: String

    init?()
    {
        print("Domain: ")
        guard let domain = readLine(), !domain.isEmpty else {
            print("input cannot be empty")
            return nil
        }
        print("Subdomain: ")
        guard let subDomain = readLine(), !subDomain.isEmpty else {
            print("input cannot be empty")
            return nil
        }
        print("Template: ")
        print("1 for Laravel")
        print("2 for Normal")
        guard let template = Template(rawValue: Int(readLine()!)!) else {
            print("input cannot be empty")
            return nil
        }
        // cloneGit = YNQuestion(text: "Clone from git? ")
        print("Group (Fisedush, Gudmundur or Helgi): ")
        guard let group = readLine(), !group.isEmpty else {
            print("input cannot be empty")
            return nil
        }
        print("Dir name: ")
        guard let dirName = readLine(), !group.isEmpty else {
            print("input cannot be empty")
            return nil
        }
        
        self.domain = domain
        self.subDomain = subDomain
        self.template = template
        self.fullDomain = ((subDomain == "") ? subDomain + "." : "") + domain
        self.documentRoot = "/var/www/\(group)/\(dirName)/"
    }

    func createConfigFile()
    {
        let path = "/etc/nginx/conf.d/"
        let filename = "\(domain).conf"
        switch template {
            case .laravel:
                do {
                    let text = Templates.laravelNginxConfig(documentRoot: documentRoot, domain: domain, subDomain: subDomain)
                    try Folder(path: path).createFile(named: filename).write(string: text)
                } catch {
                    print("Failed to create config file")
                }
            case .normal:
                do {
                    let text = Templates.laravelNginxConfig(documentRoot: documentRoot, domain: domain, subDomain: subDomain)
                    try Folder(path: path).createFile(named: filename).write(string: text)
                } catch {
                    print("Failed to create config file")
                }
        }
    }
    
    func createDocumentRoot()
    {
        do {
            try Folder(path: documentRoot)
        } catch {
            print("Failed to create document root folder")
        }
    }

    func gitCloneSite()
    {
        
    }

    func finalSetup()
    {

    }


}
