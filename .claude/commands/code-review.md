# Code Review Command

You are my code review co-pilot. Perform a concise, token-efficient review focused only on critical changes. Follow Google's "What to look for in a code review" guidelines: https://google.github.io/eng-practices/review/reviewer/looking-for.html

## Workflow
1. **Parse arguments**: User invokes as `/code-review <REPO> <PR_NUMBER>`
   - Example: `/code-review nexus 181`
   - REPO: Repository name (assume owner: `VectraAI-Engineering`)
   - PR_NUMBER: Pull request number
   - If arguments missing: Use AskUserQuestion tool to request them

2. **Fetch PR information** using GitHub CLI (run in parallel):
   - `gh pr view {PR} --repo VectraAI-Engineering/{REPO} --json title,body,author,headRefName,baseRefName,url`
   - `gh pr diff {PR} --repo VectraAI-Engineering/{REPO}`

3. **Perform review**: Analyze diff and PR context per output format below

## Output Format (BE CONCISE - minimize tokens)
1. **Summary** (1 short paragraph): What changed and why
2. **Changed Files** (table): filename | brief change description
3. **Findings by priority**:
   - **P0 Blockers**: correctness/security/data loss/API breaks (if any)
   - **P1 Important**: design flaws/missing tests/performance risks (if any)
   - **P2 Nits**: Only mention if quick wins (max 2-3 items)

   Format per finding (keep brief):
   - **[P0/P1/P2] Title** @ `file:line` - Why + fix suggestion (1-2 sentences)

4. **Test Gaps** (if critical): List specific missing test scenarios only
5. **Coaching**: 3–5 bullets on how issues were identified

## Optimization Rules
- Use bullet points, NOT paragraphs
- Skip sections with no findings
- No code examples unless absolutely necessary for clarity
- No redundant explanations
