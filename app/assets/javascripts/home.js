document.addEventListener('DOMContentLoaded', function () {
    const splashScreen = document.getElementById('splash-screen');
    const onboardingScreens = document.getElementById('onboarding-screens');
    const onboardingSteps = document.querySelectorAll('.onboarding-step');
    let currentStep = 0;

    // Show splash screen for 3 seconds
    setTimeout(() => {
        splashScreen.classList.add('hidden');
        onboardingScreens.classList.remove('hidden');
        showOnboardingStep(currentStep);
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

    // Navigate to the next step
    window.showNextStep = function() {
        if (currentStep < onboardingSteps.length - 1) {
            onboardingSteps[currentStep].classList.remove('active');
            onboardingSteps[currentStep].classList.add('slide-out-left');
            currentStep++;
            onboardingSteps[currentStep].classList.add('active');
        } else {
            navigateToSignIn();
        }
    };

    function navigateToSignIn() {
        window.location.href = '/users/sign_in';
    }

    window.navigateToSignIn = navigateToSignIn;
});
