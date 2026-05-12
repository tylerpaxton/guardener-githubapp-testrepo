# gardener-githubapp-testrepo

Test repo for the GardenerPOC GitHub App. The `main` branch ships
intentionally-stale upstream images and Actions; open a PR that
touches `Dockerfile` or `.github/workflows/ci.yml` (or both) to
exercise the Gardener scan and see the auto-comment with suggested
Chainguard equivalents.

## Layout

- `Dockerfile` — mixed multi-stage with several upstream bases
- `.github/workflows/ci.yml` — mixed actions, including some with
  chainguard-actions equivalents, some without, and one that's
  already on `chainguard-actions/*` to verify the skip path
