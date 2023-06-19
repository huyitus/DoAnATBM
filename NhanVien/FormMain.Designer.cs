
namespace NhanVien
{
    partial class FormMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.textus = new System.Windows.Forms.TextBox();
            this.textpw = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.btnok = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textus
            // 
            this.textus.Location = new System.Drawing.Point(131, 12);
            this.textus.Name = "textus";
            this.textus.Size = new System.Drawing.Size(339, 22);
            this.textus.TabIndex = 0;
            // 
            // textpw
            // 
            this.textpw.Location = new System.Drawing.Point(131, 40);
            this.textpw.Name = "textpw";
            this.textpw.Size = new System.Drawing.Size(339, 22);
            this.textpw.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "Username";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 43);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Password";
            // 
            // btnok
            // 
            this.btnok.Location = new System.Drawing.Point(212, 73);
            this.btnok.Name = "btnok";
            this.btnok.Size = new System.Drawing.Size(67, 30);
            this.btnok.TabIndex = 4;
            this.btnok.Text = "OK";
            this.btnok.UseVisualStyleBackColor = true;
            this.btnok.Click += new System.EventHandler(this.btnok_Click);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(482, 115);
            this.Controls.Add(this.btnok);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textpw);
            this.Controls.Add(this.textus);
            this.MaximizeBox = false;
            this.Name = "FormMain";
            this.Text = "Nhan vien";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textus;
        private System.Windows.Forms.TextBox textpw;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnok;
    }
}

