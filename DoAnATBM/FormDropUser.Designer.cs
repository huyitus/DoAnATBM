
namespace DoAnATBM
{
    partial class FormDropUser
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
            this.label1 = new System.Windows.Forms.Label();
            this.textName = new System.Windows.Forms.TextBox();
            this.buttonDrop = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tên user:";
            // 
            // textName
            // 
            this.textName.Location = new System.Drawing.Point(100, 20);
            this.textName.Name = "textName";
            this.textName.Size = new System.Drawing.Size(170, 22);
            this.textName.TabIndex = 1;
            // 
            // buttonDrop
            // 
            this.buttonDrop.Location = new System.Drawing.Point(100, 60);
            this.buttonDrop.Name = "buttonDrop";
            this.buttonDrop.Size = new System.Drawing.Size(75, 30);
            this.buttonDrop.TabIndex = 2;
            this.buttonDrop.Text = "Xóa";
            this.buttonDrop.UseVisualStyleBackColor = true;
            this.buttonDrop.Click += new System.EventHandler(this.buttonDrop_Click);
            // 
            // FormDropUser
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(300, 115);
            this.Controls.Add(this.buttonDrop);
            this.Controls.Add(this.textName);
            this.Controls.Add(this.label1);
            this.Name = "FormDropUser";
            this.Text = "Xóa người dùng";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormDropUser_FormClosing);
            this.Load += new System.EventHandler(this.FormDropUser_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textName;
        private System.Windows.Forms.Button buttonDrop;
    }
}