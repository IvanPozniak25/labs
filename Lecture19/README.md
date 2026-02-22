## Terraform
1. Create eks  cluster with with yaml ![EksctlCreateCluster.png](images/EksctlCreateCluster.png)
2. Verify nodes![EksNodes.png](images/EksNodes.png)
2. Create kubernetes manifest
3. Apply manifest with kubectl ![KubectlApply.png](images/KubectlApply.png)
4. Verify app is running ![AppRunning.png](images/AppRunning.png)
5. Add ebs addon to cluster with eksctl ![EksctlAddon.png](images/EksctlAddon.png)
6. Apply pvc-ebs manifest with kubectl ![KubectlApplyPVC.png](images/KubectlApplyPVC.png)
7. Add iam role for ebs addon with eksctl ![EksctlIAMRole.png](images/EksctlIAMRole.png)
8. Verify pvs ![PVCverification.png](images/PVCverification.png)
9. Create job with echo "Hello from EKS" ![KubectlApplyJob.png](images/KubectlApplyJob.png)
10. Create dev name space ![KubectlCreateNamespace.png](images/KubectlCreateNamespace.png)
11. Create busybox deployment in dev namespace ![KubectlApplyBusybox.png](images/KubectlApplyBusybox.png)![BusyBoxPods.png](images/BusyBoxPods.png)
12. Verify eks resources in AWS Console ![EksAWSConsole.png](images/EksAWSConsole.png)