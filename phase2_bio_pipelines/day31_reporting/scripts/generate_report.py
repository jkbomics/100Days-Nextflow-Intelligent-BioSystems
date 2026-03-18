from pathlib import Path

html = """
<html>
<head>
    <title>RNA-Seq Pipeline Report</title>
</head>
<body>

<h1>RNA-Seq Analysis Report</h1>

<h2>QC Reports</h2>
<p>FastQC results generated.</p>

<h2>Alignment Statistics</h2>
<p>Check alignment_stats folder.</p>

<h2>Differential Expression</h2>
<p>Results: deseq2_results.tsv</p>

<h2>Pathway Enrichment</h2>
<img src="../enrichment/kegg_dotplot.png" width="500">
<img src="../enrichment/go_dotplot.png" width="500">

</body>
</html>
"""

Path("report.html").write_text(html)