# Streambot Chef repository

This repository contains all the parts for the deployment of Streambot web services using Chef. The `cookbooks` directory contains any cookbooks that are created with the 'one cookbook per service' paradigm. That means that every service should be represented in a separate cookbook. The `environments` directory contains Chef specifications for different Chef environments, that are used for the services' deployment. The `roles` directory contains each a Chef role specification per service that gets deployed.

## TODOs

* Use encrypted data bags for secured deployment of sensitive data (i.e. Amazon AWS credentials)

## License

The MIT License (MIT)

Copyright (c) 2013 Martin Biermann

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.