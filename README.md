# Giganoid Mobile App

### What's inside

- HTTP
- Go Route

### Layers

```
📂 lib
├──📁 components
├──📁 core
├──📁 data
├──📁 domain
├──📁 views
📂 tests
├──📁 integration
├──📁 unit
├──📁 widget
```
- **core**: routes, themes, constrants, config, extras
- **data**: repositories, services
- **domain**: entities, contracts
- **components**: shared widgets
- **views**: frontend for features
- **test**: unit, widgets, integrations

---

Build runner
```
flutter pub run build_runner build --delete-conflicting-outputs
```
---

### License

MIT © [C4co](https://github.com/C4co)
