build-base:
	flutter pub get;\
	cd ios;\
	pod install --repo-update;\

clean-build-base:
	flutter clean;\
	flutter pub get;\
	cd ios;\
	pod cache clean --all ;\
	pod install --repo-update;\


generate-text-local:
	dart run easy_localization:generate -S "assets/languages" -o "locale_keys.g.dart" -f keys;\

manual-generate:
	flutter pub get;\
	dart run easy_localization:generate -S "assets/languages" -o "locale_keys.g.dart" -f keys;\
	dart run build_runner build --delete-conflicting-outputs ;\


### use this when firebase options available and run locally
generate-dev-build:
	flutter build apk --release -t lib/main.dart;\

generate-prod-build:
#//todo: run firebase options here
	flutter build apk --release -t lib/main.dart;\

#//todo: need to write for github apk generation, use firebase token passing