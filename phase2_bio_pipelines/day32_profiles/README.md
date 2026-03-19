Day 32 — Profile-based execution for multi-environment support.

Implemented Nextflow profiles to enable pipeline execution across local, Docker, and HPC (SLURM) environments.

This allows the same workflow to scale from development systems to production clusters without modifying the core pipeline logic.