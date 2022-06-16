import 'package:yoga_training_app/models/course.dart';
import 'package:yoga_training_app/models/style.dart';

final _treeStyle = Style(
    imageUrl: 'assets/images/pose2.png',
    name: 'Tree\nPose',
    time: 5,
    title: 'Tree Pose',
    students: "Beginner Level",
    steps: [
      "Take a moment to feel both your feet root into the floor, your weight distributed equally on all four corners of each foot",
      "Begin to shift your weight into your right foot, lifting your left foot off the floor. Keep your right leg straight but don't lock the knee.",
      "Bend your left knee and bring the sole of your left foot high onto your inner right thigh.",
      "Press your foot into your thigh and your thigh back into your foot with equal pressure. This will help you keep both hips squared toward the front so your right hip doesn't jut out.",
      "Focus your gaze (Drishti) on something that doesn't move to help you keep your balance.",
      "Take 5 to 10 breaths, then lower your left foot to the floor and do the other side.",
    ],
    gifurl:
        "assets/images/tree.webp");
final _chairStyle = Style(
    imageUrl: 'assets/images/chair4.png',
    name: 'Chair\nPose',
    title:'Chair Pose',
    time: 8,
    students: "Beginner Level",
    steps: [
      "Stand straight and tall with your feet slightly wider than hip­-width apart and your arms at your sides.",
      "Inhale and lift your arms next to your ears, stretching them straight and parallel with wrists and fingers long. Keep your shoulders down and spine neutral.",
      "Exhale as you bend your knees, keeping your thighs and knees parallel. Lean your torso forward to create a right angle with the tops of your thighs. Keep your neck and head in line with your torso and arms. Hold for 30 seconds to 1 minute.",
    ],
    gifurl:
        "assets/images/chair2.gif");
final _cobraStyle = Style(
    imageUrl: 'assets/images/cobra2.png',
    name: 'Cobra\nPose',
    title: 'Cobra Pose',
    time: 6,
    students: "Beginner Level",
    steps: [
      "Place your palms flat on the ground directly under your shoulders. Bend your elbows straight back and hug them into your sides.",
      "Pause for a moment looking straight down at your mat with your neck in a neutral position. Anchor your pubic bone to the floor.",
      "Inhale to lift your chest off the floor. Roll your shoulders back and keep your low ribs on the floor. Make sure your elbows continue hugging your sides. Don't let them wing out to either side.",
      "Keep your neck neutral. Don’t crank it up. Your gaze should stay on the floor.",
    ],
    gifurl: "assets/images/cobra.webp");
final _warriorStyle = Style(
    imageUrl: 'assets/images/warrior2.png',
    name: 'Warrior-3\nPose',
    time: 5,
    title: 'Warrior-3 Pose',
    students: "Beginner Level",
    steps: [
      "Begin in Virabhadrasana I (Warrior Pose I) with your right foot forward.",
      "Root down firmly with your right heel to lift your lower belly, drawing the abdominals in and up and releasing your tailbone down.",
      "Firm your right outer hip into your midline as you straighten your left leg.",
      "Energize your arms to draw more length into your side body.",
      "Turn your left inner thigh toward the ceiling to roll your left outer hip forward, then pivot onto your back toes so your back leg is in a neutral position.",
      "Inhale to lengthen your spine.",
      "Exhale and tilt your torso forward, and reach your arms out ahead.",
      "Shift your weight into your front foot, and move forward as you lift your left leg until it is parallel to the floor.",
      "Your upper arms frame your ears, and your head, torso, pelvis, and lifted leg to form a straight line.",
      "Continue to turn your left inner thigh to the ceiling so your leg remains neutral and your pelvis is level.",
      "Continue to engage your right outer hip to provide stability for your standing leg.",
      "Push back with your left heel while extending forward with your arms, the crown of your head, and your sternum.",
      "Tone your lower belly, and direct your tailbone toward your left heel to provide support for your lower back.",
      "Hold for 5–10 breaths, then carefully bend your right knee and step back with your left foot, returning to Virabhadrasana I.",
      "Exit, and repeat on the other side.",
    ],
    gifurl:
        "assets/images/warrior2.gif");
final _dogStyle = Style(
    imageUrl: 'assets/images/dog.png',
    name: 'Dog\nPose',
    title: 'Dog Pose',
    students: "Beginner Level",
    time: 8,
    steps: [
      "Start in an all fours position, with your hips above your knees and shoulders above your wrists.",
      "Bring your hands slightly forwards of your shoulders, with your middle finger pointing forward, spread your fingers.",
      "Think about creating a suction cup in the middle of your palm by pressing through the outer edges of the palm, the base of the fingers and the fingertips. This is called Hasta Bandha.",
      "Create a spiral action in your arms by rolling your upper arms away from you and your forearms spiralling inwards (see Beginners’ tips for more detailed instructions).",
      "Tuck your toes under, and on an exhalation, engage your lower belly drawing the navel back to the spine. Press through your hands and lift your hips back and up to bring yourself into an upside-down V pose.",
      "Keep your knees bent at first as you find length in your spine.",
      "Slide your shoulder blades down along the spine, collar bones spread. The base of the neck relaxed.",
      "Maintaining length in the spine, ‘walk your dog’ by alternately bending and straightening your legs. Eventually bringing both heels towards the floor. They do not have to touch the floor.",
    ],
    gifurl:
        "assets/images/dog2.gif");

final styles = [
  _chairStyle,
  _treeStyle,
  _dogStyle,
  _cobraStyle,
  _warriorStyle,
  
];

final _course1 = Course(
    imageUrl: 'assets/images/course1.jpg',
    name: 'Advance Stretchings',
    time: 45,
    students: 'Advanced');

final _course2 = Course(
    imageUrl: 'assets/images/course2.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate');

final _course3 = Course(
    imageUrl: 'assets/images/course3.jpg',
    name: 'Meditation',
    time: 20,
    students: 'Beginner');

final List<Course> courses = [_course1, _course3, _course2];
