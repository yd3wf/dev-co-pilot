# Frontend Delivery

Use this reference for a page, component, interaction, client-side state, visual
regression, or browser-only failure. Adapt to the framework already in the
repository; do not introduce a framework, state library, or component system
without a concrete need.

## Establish the real client boundary

Before changing behavior, locate the route or entry component, its parent layout,
the user action or lifecycle trigger, state ownership, request client, and the
API response-to-view-model mapping. Also identify existing conventions for
components, styles, forms, translations, permissions, and tests.

For an interaction, describe the observable states: initial, loading, success,
empty, validation failure, request failure, forbidden, and retry when applicable.
Do not claim a visual result without inspecting the rendered UI or an existing
visual test.

## Implement a frontend change

1. Reuse the nearest established component, request, state, and error-handling
   patterns before creating an abstraction.
2. Keep server payload types at the request boundary. Convert to view-specific
   data deliberately; preserve absent/null/default distinctions when they affect
   behavior.
3. Make loading, disabled, duplicate-submit, error, and empty states explicit
   when the interaction can reach them. Do not hide a failed request behind a
   false success state.
4. Preserve route guards and client-side permission checks, but never treat them
   as a replacement for server-side authorization.
5. For user-facing controls, check keyboard operation, meaningful labels, focus
   behavior, and responsive layout in proportion to the changed surface.

## Review or debug a frontend issue

Correlate browser console errors, Network requests/responses, rendered state, and
the relevant source locations. Separate a render/state defect from a request,
contract, permission, or server defect. Include request IDs and sanitized payload
differences when available; never expose credentials.

## Verify proportionately

Run the project's existing formatter, type check, lint, component/unit test, or
end-to-end test that covers the change. When browser verification is available,
exercise the success path plus the changed failure or boundary state. Report which
checks ran and which visual, accessibility, or device-size checks remain pending.
