
# Huawei Cloud OBS Sync Action

![GitHub Marketplace](https://img.shields.io/badge/Marketplace-OBS%20Sync-blue.svg?colorA=24292e&colorB=0366d6&style=flat-square)  
Easily sync your local files or directories to **Huawei Cloud OBS** (Object Storage Service) directly from your GitHub Actions workflows.

## Features

- Automates syncing files or directories to Huawei Cloud OBS.
- Securely integrates with OBS using environment secrets.
- Uses [`obsutil`](https://support.huaweicloud.com/intl/en-us/utiltg-obs/obs_11_0001.html) for high-performance uploads.

---

## Usage

### Example Workflow

Here’s an example of how to use this action in your GitHub workflow:

```yaml
name: Sync to Huawei Cloud OBS

on:
  push:
    branches:
      - main

jobs:
  sync-job:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Sync Data to Huawei OBS
        uses: nippa-97/obs-sync-action@v1.0.1
        with:
          accessId: ${{ secrets.ACCESS_ID }}
          secretKey: ${{ secrets.SECRET_KEY }}
          endPoint: ${{ secrets.END_POINT }}
          obsBucket: ${{ secrets.BUCKET }}
          localPath: './'  # Directory for sync
```

---

## Inputs

| Name          | Description                                                   | Required | Example                                      |
|---------------|---------------------------------------------------------------|----------|----------------------------------------------|
| `accessId`    | Access ID for Huawei Cloud OBS.[`More Info`](https://support.huaweicloud.com/intl/en-us/clientogw-obs/obs_03_0405.html)                              | Yes      | `${{ secrets.ACCESS_ID }}`                  |
| `secretKey`   | Secret Key for Huawei Cloud OBS. [`More Info`](https://support.huaweicloud.com/intl/en-us/clientogw-obs/obs_03_0405.html)                              | Yes      | `${{ secrets.SECRET_KEY }}`                 |
| `endPoint`    | Endpoint URL for Huawei Cloud OBS. [`More Info`](https://support.huaweicloud.com/intl/en-us/productdesc-obs/obs_03_0152.html)                           | Yes      | `https://obs.ap-southeast-1.myhuaweicloud.com` |
| `obsBucket`   | OBS bucket name.                                              | Yes      | `my-bucket`                     |
| `localPath`   | Local path to the directory or file to be synced.             | Yes      | `./directory or file for sync`                            |

---

## Secrets Configuration

Store your sensitive information (e.g., `ACCESS_ID`, `SECRET_KEY`, `END_POINT`, `BUCKET`) securely in GitHub secrets:

1. Go to your repository on GitHub.
2. Click on **Settings** > **Secrets and Variables** > **Actions**.
3. Add the following secrets:
   - `ACCESS_ID`: Your Huawei Cloud OBS Access Key ID.
   - `SECRET_KEY`: Your Huawei Cloud OBS Secret Key.
   - `END_POINT`: The endpoint URL of your OBS instance.
   - `BUCKET`: The bucket name (e.g., `bucket-name`).

---

## Requirements

- A valid Huawei Cloud account with OBS access.
- Properly configured OBS bucket and permissions.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Troubleshooting

If you encounter issues, check the following:
- Verify that all secrets are set correctly in your repository.
- Ensure that the bucket path includes the correct region and bucket name.
- Check the `obsutil` logs in the action's output for additional details.

Feel free to open an issue if you encounter any problems or have feature requests!