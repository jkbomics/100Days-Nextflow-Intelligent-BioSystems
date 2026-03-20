def checkFileExists(filePath, name) {
    if (!file(filePath).exists()) {
        error "ERROR: ${name} not found -> ${filePath}"
    }
}

def validateParams(params) {

    println "Validating pipeline parameters..."

    checkFileExists(params.input, "Input directory")
    checkFileExists(params.metadata, "Metadata file")
    checkFileExists(params.annotation, "Annotation file")
    checkFileExists(params.star_index, "STAR index directory")

    println "All required inputs are valid."
}