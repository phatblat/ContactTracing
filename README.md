# ContactTracing

An exploratory POC of the joint Apple/Google COVID-19 Contact Tracing system.
Implemented as a macOS framework.

## Specs

These documents are linked to from the above blog post.

- [System Overview](https://blog.google/documents/57/Overview_of_COVID-19_Contact_Tracing_Using_BLE.pdf)
- [Cryptography Specification](https://blog.google/documents/56/Contact_Tracing_-_Cryptography_Specification.pdf)
- [Bluetooth Specification](https://blog.google/documents/58/Contact_Tracing_-_Bluetooth_Specification_v1.1_RYGZbKW.pdf)
- [Apple Contact Tracing Framework API](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ContactTracing-FrameworkDocumentation.pdf)
- [Android Contact Tracing API](https://blog.google/documents/55/Android_Contact_Tracing_API.pdf)

## References

- [Apple's Announcement](https://www.apple.com/covid19/contacttracing)
- [Google's Announcement](https://blog.google/inside-google/company-announcements/apple-and-google-partner-covid-19-contact-tracing-technology)
- HKDF [RFC 5869](https://tools.ietf.org/html/rfc5869)
- HMAC [RFC 2104](https://tools.ietf.org/html/rfc2104)
- [Cryptography and Your Apps](https://developer.apple.com/videos/play/wwdc2019/709) WWDC video
- [Apple CryptoKit](https://developer.apple.com/documentation/cryptokit)

## Overview

The ContactTracing Framework is designed to help developers implement a privacy- preserving contact tracing solution. It covers two user roles:

1. __Affected User__. A user who reports themself as positively diagnosed as having the virus.
2. __Exposed User__. A user who has notified themself as potentially exposed to an Affected User.

### Affected User

When a user is positively affected, their Daily Tracing Keys should be shared with other uses to alert them to potential exposure. These Daily Tracing Keys are retrieved using CTSelfTracingInfoRequest.

### Exposed User

Given a set of positively affected Daily Tracing Keys, the framework allows you to
determine whether those Daily Tracing Keys were observed locally by the user,
indicating potential exposure. If so, additional information such as date and
duration may also be retrieved. Possible observations can be retrieved using
`CTExposureDetectionFinishHandler`, and additional information using
`CTExposureDetectionContactHandler`.

The following illustration outlines the flow of the ContactTracing Framework for iOS.

## 📄 License

This repo is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for rights and limitations.
