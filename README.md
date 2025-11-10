# X: OCFL Doctor

This is an experiment: Can we use Claude Code as an agent to debug and
facilitate repair of invalid OCFL objects?

To run it, clone the repo and start it in a dev container (for your own
protection). It's meant to be run with Claude Code's
`--dangerously-skip-permissions` enabled.

```sh
# delete results from previous runs if necessary
rm -rf logs/*

# start the agent
$ claude --dangerously-skip-permissions @prompt.md
```

Overview:

- `prompt.md` is the initial prompt that launches subagents to check each object
- `.claude/skills/ocfl-debug.md` is an OCFL debugging
  [skill](https://docs.claude.com/en/docs/agents-and-tools/agent-skills/overview)
  used by subagents.
- results are written to `logs/`
- `object-key.age` has mappings of objects to fixture names. It's encrypted to
  prevent the agent from cheating.
