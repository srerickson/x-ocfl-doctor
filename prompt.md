The `objects` folder includes OCFL objects as sub-directories. For each object,
launch a subagent to:

- validate the object
- if the object is invalid, use the validation output and your review of the
  object itself to generate a report. The report should include recommended
  steps to address the validation errors.
- Save the reports in the logs folder with the name of the object (e.g.,
  obj-004.txt).
- Do not generate reports for valid objects.

Once all agents have completed their work, save a summary to logs/summary.txt

You should not need to generate any code. Each subagent should write the report
itself.
