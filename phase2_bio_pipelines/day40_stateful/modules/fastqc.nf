params {
    input = "./input"
}

process {

    executor = 'local'

    withLabel: qc {
        cpus = 2
        memory = '2 GB'
    }

}

timeline {
    enabled = true
    file = "timeline.html"
}

report {
    enabled = true
    file = "execution_report.html"
}

trace {
    enabled = true
    file = "trace.txt"
}