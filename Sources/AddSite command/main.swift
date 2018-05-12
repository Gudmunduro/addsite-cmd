if let setup = Setup() {
    setup.createConfigFile()
    setup.createDocumentRoot()
    setup.finalSetup()
    print("Site created!")
} else {
    print("Setup script failed")
}
