# 📘 Data Engineering Zoomcamp Repository

Welcome to my repository dedicated to the **Data Engineering Zoomcamp** by [DataTalksClub](https://github.com/DataTalksClub/data-engineering-zoomcamp)! 🚀 This repository serves as a learning journal and a hands-on space to implement the concepts covered in this comprehensive bootcamp. If you're looking to explore data engineering or follow along with the bootcamp, you're in the right place.

---

## 🌟 About the Bootcamp

The **Data Engineering Zoomcamp** is an incredible resource for aspiring data engineers and professionals who want to enhance their skills. It covers essential topics like:

- Docker
- Data ingestion and transformation
- Data warehouses and orchestration
- Streaming and batch data processing

You can find more details about the bootcamp [here](https://github.com/DataTalksClub/data-engineering-zoomcamp).

---

## 📂 Repository Structure

Each folder in this repository corresponds to a specific week or topic from the bootcamp. Below is the current progress:

### Week 1: **Docker & Terraform Fundamentals** 🐳☁️

In the first week, we delve into two essential tools that form the backbone of modern data engineering infrastructure:

#### **Docker**
Docker is a platform that enables developers to package applications into containers—standardized executable components combining application source code with the operating system libraries and dependencies required to run that code in any environment. This ensures consistency across multiple development, testing, and deployment environments.

**Key Learnings:**
- **Containerization:** Understanding the concept of containers and how Docker facilitates the creation and management of these lightweight, portable environments.
- **Docker Images and Containers:** Learning the difference between images (the blueprint) and containers (the running instances).
- **Docker Commands:** Familiarization with essential Docker commands such as `docker build`, `docker run`, `docker-compose`, and managing container lifecycles.
- **Networking in Docker:** Setting up Docker networks to allow communication between containers, crucial for multi-container applications.
- **Persistent Storage:** Implementing Docker volumes to persist data beyond the lifecycle of a container.

**Hands-On Projects:**
- **Containerizing a PostgreSQL Database:** Setting up a PostgreSQL database within a Docker container to streamline development and testing environments.
- **Multi-Container Application with Docker Compose:** Using Docker Compose to define and run a multi-container application, including services like PostgreSQL and pgAdmin for database management.

#### **Terraform**
Terraform is an open-source Infrastructure as Code (IaC) tool that allows you to define and provision infrastructure using a high-level configuration language. It enables the automation of infrastructure tasks, ensuring consistency and reducing the potential for human error.

**Key Learnings:**
- **Infrastructure as Code (IaC):** Grasping the principles of IaC and how Terraform implements these concepts to manage infrastructure.
- **Providers and Resources:** Understanding Terraform providers (e.g., Google Cloud Platform) and defining resources such as storage buckets and virtual machines.
- **State Management:** Learning how Terraform manages infrastructure state and the importance of the state file in tracking resource changes.
- **Execution Planning:** Utilizing `terraform plan` to preview changes before applying them, ensuring safe and predictable modifications.
- **Applying Configurations:** Deploying infrastructure changes with `terraform apply` and managing the lifecycle of resources.

**Hands-On Projects:**
- **Provisioning GCP Resources:** Using Terraform to automate the creation of Google Cloud Platform resources, including storage buckets and BigQuery datasets.
- **Version Control Integration:** Managing Terraform configurations in version control systems to track changes and collaborate effectively.

Explore my implementations and detailed notes in the [Week 1 folder](https://github.com/Quiago/data-zoomcamp/tree/main/week1).

### Week 2: **Workflow Orchestration with Kestra** 🔄📅

In Week 2, we delve into workflow orchestration using [Kestra](https://kestra.io/), an open-source, event-driven orchestration platform that simplifies building both scheduled and event-driven workflows. By adopting Infrastructure as Code practices for data and process orchestration, Kestra enables the creation of reliable workflows with just a few lines of YAML.

**Key Learnings:**
- **Introduction to Workflow Orchestration:** Understanding the importance and concepts of orchestrating data workflows.
- **Kestra Basics:** Setting up Kestra and exploring its core features.
- **Building ETL Pipelines:** Creating ETL pipelines to extract data from CSV files, load it into PostgreSQL or Google Cloud (GCS + BigQuery), and perform transformations.
- **Scheduling and Backfilling:** Managing workflow schedules and handling historical data processing.
- **Integrating dbt:** Orchestrating dbt models within Kestra for data transformations.

**Resources:**
- [Kestra Documentation](https://kestra.io/docs/)
- [Week 2 Materials](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/02-workflow-orchestration)

Explore my implementations and notes in the [Week 2 folder](https://github.com/Quiago/data-zoomcamp/tree/main/week2).

---

## 🖋️ Follow My Journey on LinkedIn

I regularly share insights, articles, and updates about the bootcamp and data engineering in general on LinkedIn. Follow me to stay updated and connect for discussions about data!

📌 [Quiago's LinkedIn](https://www.linkedin.com/in/quiago/)

---

## 🌐 Join the DataTalksClub Community

A special thanks to [DataTalksClub](https://www.linkedin.com/company/datatalksclub/) for organizing this amazing bootcamp and for providing a vibrant community of learners and professionals.

---

Feel free to explore the repository, provide feedback, and connect with me! Let's build something great together! 💻✨
