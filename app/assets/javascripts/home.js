document.addEventListener('DOMContentLoaded', function() {
  const splashScreen = document.getElementById('splash-screen');
  const onboardingScreens = document.getElementById('onboarding-screens');
  const authScreens = document.getElementById('auth-screens');

  const onboardingSteps = document.querySelectorAll('.onboarding-screen');
  let currentStep = 0;

  setTimeout(() => {
    splashScreen.style.display = 'none';
    onboardingScreens.style.display = 'flex';
    showOnboardingStep(currentStep);
  }, 10000); // Show splash screen for 3 seconds

  function showOnboardingStep(step) {
    onboardingSteps.forEach((screen, index) => {
      screen.style.display = index === step ? 'flex' : 'none';
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
    onboardingScreens.style.display = 'none';
    authScreens.style.display = 'flex';
  });
});