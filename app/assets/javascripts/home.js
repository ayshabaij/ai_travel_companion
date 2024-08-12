document.addEventListener('DOMContentLoaded', function() {
  const splashScreen = document.getElementById('splash-screen');
  const onboardingScreens = document.getElementById('onboarding-screens');
  const authScreen = document.getElementById('auth-screen');

  const onboardingSteps = document.querySelectorAll('.onboarding-step');
  let currentStep = 0;

  // Show splash screen for 3 seconds
  setTimeout(() => {
    splashScreen.classList.add('hidden');
    onboardingScreens.classList.remove('hidden');
    showOnboardingStep(currentStep);
    startOnboardingCarousel();
  }, 3000); // 3000 milliseconds = 3 seconds

  function showOnboardingStep(step) {
    onboardingSteps.forEach((screen, index) => {
      screen.classList.remove('active', 'slide-out-left');
      if (index === step) {
        screen.classList.add('active');
      } else if (index < step) {
        screen.classList.add('slide-out-left');
      }
    });
  }

  function startOnboardingCarousel() {
    setInterval(() => {
      currentStep = (currentStep + 1) % onboardingSteps.length;
      showOnboardingStep(currentStep);
    }, 3000); // 3000 milliseconds for each step display time
  }
});
