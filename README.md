# GitHub Action to Sync DigitalOcean Space 🔄 

> **⚠️ Note:** To use this action, you must have access to the [GitHub Actions](https://github.com/features/actions) feature. GitHub Actions are currently only available in public beta. You can [apply for the GitHub Actions beta here](https://github.com/features/actions/signup/).

This simple action uses the [vanilla AWS CLI](https://docs.aws.amazon.com/cli/index.html) to sync a directory (either from your repository or generated during your workflow) with a remote DigitalOcean space.

**Performing this action deletes any files in the bucket that are *not* present in the source directory.** Working on making this optional in the next release!

## Usage

### `workflow.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```
name: Sync Space
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: idlefingers/do-space-sync-action@master
      with:
        args: --acl public-read
      env:
        SOURCE_DIR: './public'
        SPACE_NAME: ${{ secrets.SPACE_NAME }}
        SPACE_REGION: ${{ secrets.SPACE_REGION}}
        SPACE_ACCESS_KEY_ID: ${{ secrets.SPACE_ACCESS_KEY_ID }}
        SPACE_SECRET_ACCESS_KEY: ${{ secrets.SPACE_SECRET_ACCESS_KEY }}
```


### Required Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `SOURCE_DIR` | The local directory you wish to sync/upload. For example, `./public`. | `env` | **Yes** |
| `SPACE_REGION` | The region where you created your space in. For example, `fra1`. [Full list of regions here.](https://www.digitalocean.com/docs/platform/availability-matrix/) | `env` | **Yes** |

### Optional Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `DEST_DIR` | The remote directory you wish to sync/upload. For example, `./public`. | `env` | No |

### Required Secret Variables

The following variables should be added as "secrets" in the action's configuration.

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `SPACE_NAME` | The name of the space you're syncing to. For example, `jarv.is`. | `secret` | **Yes** |
| `SPACE_ACCESS_KEY_ID` | Your Spaces Access Key. [More info here.](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key) | `secret` | **Yes** |
| `SPACE_SECRET_ACCESS_KEY` | Your Spaces Secret Access Key. [More info here.](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key) | `secret` | **Yes** |


## License

This project is distributed under the [MIT license](LICENSE.md).

## Credits

This project is forked from https://github.com/jakejarvis/s3-sync-action with small changes to make the s3 commands work with DigitalOcean.
