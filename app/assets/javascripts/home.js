document.addEventListener('DOMContentLoaded', function() {
  const splashScreen = document.getElementById('splash-screen');
  const onboardingScreens = document.getElementById('onboarding-screens');
  const authScreen = document.getElementById('auth-screen');

  const onboardingSteps = onboardingScreens.children;
  let currentStep = 0;

  // Show splash screen for 3 seconds
  setTimeout(() => {
    splashScreen.classList.add('hidden');
    onboardingScreens.classList.remove('hidden');
    showOnboardingStep(currentStep);
  }, 3000); // 3000 milliseconds = 3 seconds

  function showOnboardingStep(step) {
    Array.from(onboardingSteps).forEach((screen, index) => {
      screen.classList.toggle('active', index === step);
    });
  }

  document.getElementById('next1').addEventListener('click', function() {
    currentStep = 1;
    showOnboardingStep(currentStep);
  });

  document.getElementById('next2').addEventListener('click', function() {
    currentStep = 2;
    showOnboardingStep(currentStep);
  });

  document.getElementById('get-started').addEventListener('click', function() {
    onboardingScreens.classList.add('hidden');
    authScreen.classList.remove('hidden');
  });
});
