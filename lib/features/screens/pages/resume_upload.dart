import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:job_finder_app/features/screens/pages/apply_job.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';

class ResumeUploadScreen extends StatefulWidget {
  const ResumeUploadScreen({super.key});

  @override
  State<ResumeUploadScreen> createState() => _ResumeUploadScreenState();
}

class _ResumeUploadScreenState extends State<ResumeUploadScreen> {
  double uploadProgress = 0.0;
  String? uploadedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      String fileName = result.files.single.name;
      String extension = fileName.split('.').last.toLowerCase();

      if (!['pdf', 'doc', 'docx'].contains(extension)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Only PDF, DOC, or DOCX files allowed!"),
          ),
        );
        return;
      }

      setState(() {
        uploadedFile = fileName;
        uploadProgress = 0.1;
      });

      for (int i = 1; i <= 10; i++) {
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          uploadProgress = i / 10;
        });
      }
    }
  }

  void _removeFile() {
    setState(() {
      uploadProgress = 0.0;
      uploadedFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume & Portfolio"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Resume or CV",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 1.2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                children: [
                  if (uploadedFile == null && uploadProgress == 0.0) ...[
                    Text(
                      "Upload your CV or Resume and\nuse it when you apply for jobs",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.colorScheme.onBackground),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _pickFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Upload a Doc | Docx | PDF",
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ] else if (uploadProgress < 1.0 && uploadedFile != null) ...[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: uploadProgress,
                        strokeWidth: 6,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Uploading ${(uploadProgress * 100).toInt()}%",
                      style: TextStyle(color: theme.colorScheme.onBackground),
                    ),
                  ] else if (uploadedFile != null) ...[
                    Row(
                      children: [
                        Icon(
                          uploadedFile!.endsWith("pdf")
                              ? Icons.picture_as_pdf
                              : Icons.description,
                          color:
                              uploadedFile!.endsWith("pdf")
                                  ? Colors.red
                                  : Colors.blue,
                          size: 40,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            uploadedFile!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: _removeFile,
                          icon: Icon(
                            Icons.close,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Portfolio (Optional)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              children: [
                _portfolioButton("Portfolio Link"),
                _portfolioButton("Add PDF"),
                _portfolioButton("Add Photos"),
              ],
            ),

            const Spacer(),

            ElevatedButton(
              onPressed:
                  uploadedFile != null
                      ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ApplyScreen(job: {}),
                          ),
                        );
                      }
                      : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    uploadedFile != null
                        ? Colors.green
                        : theme.colorScheme.onBackground,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(color: AppColors.textWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _portfolioButton(String text) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(color: theme.colorScheme.onBackground),
      ),
    );
  }
}
