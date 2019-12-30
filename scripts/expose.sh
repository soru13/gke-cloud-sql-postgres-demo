#!/bin/bash -e

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# In order to not expose this project to the internet with a
# Cloud Load Balancer we are instead port-forwarding to the node and
# exposing the pod port

POD_ID=$(kubectl --namespace production get pods -o name | cut -d '/' -f 2)
kubectl --namespace production port-forward "$POD_ID" 8080:80
