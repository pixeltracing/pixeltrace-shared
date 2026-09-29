# AI Agent directives for pixeltrace-app

Whenever you are making edits to the codebase(s) in this repo, follow the guidelines in this file unless there is a very good reason not to do so.

**Note**: read this entire document; if you are using e.g. `head -50` to preview the document, you will miss important instructions.

## YAGNI

"You ain't gonna need it."

Do not write code to handle speculative future applications unless they have already been discussed and are planned.

## Assumptions

Assumptions about real-world behavior are dangerous. Do not make them. When you can run an isolated test to confirm or deny an assumption, do so, and promote the assumption to settled fact (if the test allows). Where you cannot do this, ask your human.

## Comments in code

Writing good comments is a difficult skill even for experienced humans. The general principle to follow is: comments should clarify intent, not mechanism (unless the mechanism itself was chosen with specific intent).

Adhere to the following guidelines:

- Do not write a comment that restates the code:
  - If the comment is an English transcription of the lines below it, delete it.
  - If the comment is a description of a test that is equally well described by the test's name, delete it.
- Do not write a comment that explains something that used to be here, but moved elsewhere.
- Do not write a comment about situations that no longer apply or occur.
- Prefer semantic-block-level comments. For example, a small type should likely have a single doc comment on the type, not comments on each field.
- Comment only where a competent reader of this codebase would guess wrong. Long stretches with no comments are correct and expected. Not every change needs a source comment.
- Verbosity scales inversely with certainty. Where you are sure, be terse or omit comments altogether. Where you are unsure, be explicit, clear, and concise.
- Stick to ASCII, even if the codebase already has non-ASCII. In place of em-dashes in particular, prefer commas or (sparingly) parentheticals.

In general, you should withhold all comments until you are done making changes. Then, you can perform a pass over your changes and insert comments where justified by the above guidelines. You likely do not need to re-run tests or typechecks, etc, after comment-only changes.

## Dependencies

A dependency can be taken if it handles significant complexity outside of the core competence of this repo. A dependency should not be taken if it be implemented in less than, say, 100 lines of code.