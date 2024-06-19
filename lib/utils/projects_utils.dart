class ProjectsUtils{
   final String image;
  final String title;
  final String subtitle;


ProjectsUtils({
  required this.image,
  required this.title,
  required this.subtitle,
});
}
List<ProjectsUtils> myProjectsUtils = [
  ProjectsUtils(
    image: 'assets/one.png',
    title: 'LearnSoft School ERp',
    subtitle: 'A sytem that  centralizes student information, staff details, and manages admissions, timetables, and attendance.',
  ),
  ProjectsUtils(
    image: 'assets/three.png',
    title: 'Blogs',
    subtitle: 'A system that allows users to users to create, publish, and manage blog posts easily',
  ),
  ProjectsUtils(
    image: 'assets/two.png',
    title: 'Student Management System',
    subtitle: 'A software that that centralizes and automates student-related processes, including enrollment, etc.',
  ),
];