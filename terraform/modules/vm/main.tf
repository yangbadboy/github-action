resource "google_service_account" "bastion-sa" {
  account_id   = "bastion-sa"
  display_name = "bastion-sa"
}

resource "google_project_iam_member" "bastion" {
  project = "gamehub-stg1"  # Thay bằng Project ID của bạn
  role    = "roles/srorage.admin"  # Vai trò chỉ đọc Compute Engine
  member  = "serviceAccount:${google_service_account.bastion-sa.email}"
}