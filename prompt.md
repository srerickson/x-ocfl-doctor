The `objects` folder includes OCFL objects as sub-directory. For each object,
you launch a subagent to:

- validate the object
- if the object is invalid, use the validation output and your review of the
  object itself to generate a report. The report should include recommended steps
  for fixing the object and addressing validation errors.
- Save the reports in the logs folder with the name of the object (e.g.,
  obj-004.txt).
- Do not generate report for valid objects

Once all agents have completed their work, save a summary to
logs/summary.txt

You should not need generate any code. The subagent should
write the report itself.
