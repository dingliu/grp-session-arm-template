# Demo Repo for Toronto Cloud Group Session

Slides: [Gooogle slides](https://docs.google.com/presentation/d/1Gv4hiradXgsnu-YDPvXJ4mPxZCH-cUrcXmMVjun9Qiw/?usp=sharing)

This is the code repo for the demos in Toronto Cloud Group Session: ARM Template & IaC.

## Folder Structure and Files

```
.
├── LICENSE
├── README.md              // This README file
├── azure-pipeline.yaml    // Azure DevOps pipeline definition
├── kubectl-step.yml       // Repeatable step definition for pipeline
├── cluster-arm
│   ├── // ARM templates for an AKS cluster and its resource group
│   └── ...
├── cluster-manifests
│   ├── // Kubernetes manifests for hello-app. (from GKE example)
│   └── ...
├── hello-app
│   ├── // hello-app code and Docker file. (from GKE example)
│   └── ...
└── local-demo
    ├── // Local demo used during the group session
    └── ...
```

## PLEASE NOTE

This repo should be used for demonstration purpose only.

The code here is NOT suitable for production use. It doesn't have:

- Automated tests & TDD
- Semantic versioning & dependency control
- Continuous monitoring & continuous feedback
- Feature flags
- Environments separation: dev, test, and prod
- Backup & DR


THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
