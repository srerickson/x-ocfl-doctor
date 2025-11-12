The `objects` folder includes OCFL objects as sub-directories. For each object,
launch a subagent to check the object and repair it, if necessary. Each subagent
should:

- validate the object.
- If the object is valid, skip it.
- if the object is invalid, try to repair the object by first creating a copy of
  the object in the `repaired` folder. Never modify the original object in the
  `objects` folder.
- Do your best address validation errors without deleting existing content.
- Save a log of your work in the `logs` folder in a `.txt` with the same name
  as the object folder (e.g., `logs/obj-021.txt`).

Once all agents have completed their work, save a summary to logs/summary.txt
